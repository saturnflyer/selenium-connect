# Encoding: utf-8

require 'json'
require 'sauce_whisk'
require 'rest_client'
require 'sauce/client'

module SeleniumConnect
  module Service
    module Sauce
      class Facade

        attr_writer :job_id

        def initialize(timeout, username, access_key)
          @timeout = timeout
          ENV['SAUCE_USERNAME'] = username
          ENV['SAUCE_ACCESS_KEY'] = access_key
        end

        def fail_job
          requires_job_id
          SauceWhisk::Jobs.fail_job @job_id
        end

        def pass_job
          requires_job_id
          SauceWhisk::Jobs.pass_job @job_id
        end

        def fetch_last_screenshot
          requires_job_id
          polling_api_request @timeout do
            SauceWhisk::Jobs.fetch_asset @job_id, 'final_screenshot.png'
          end
        end

        def fetch_server_log
          requires_job_id
          polling_api_request @timeout do
            SauceWhisk::Jobs.fetch_asset @job_id, 'selenium-server.log'
          end
        end

        def fetch_job_data
          requires_job_id
          # TODO: let's switch this over to use whisk as well
          # This is used because it's easy to get all the data out of the job
          begin
            job = ::Sauce::Job.find @job_id
            JSON.parse job.to_json
          rescue StandardError => exception
            puts "An error occured while fetching the job data: #{exception.message}"
          end
        end

        private

          def requires_job_id
            fail ArgumentError, "#{caller[0][/`.*'/][1..-2]} requires that the job_id be set in this object." unless @job_id
          end

          def polling_api_request(timeout)
            sleep 1
            yield
            rescue RestClient::Exception => exception
              if timeout > 0
                polling_api_request(timeout - 1) { yield }
              else
                puts "Request timed out after #{timeout} with: #{exception.message}"
              end
          end

      end
    end
  end
end
