# Encoding: utf-8

require 'selenium_connect/report/job_report'
require 'selenium_connect/report/main_report'

# selenium connect
class SeleniumConnect
  module Report
    # creates report objects
    class ReportFactory

      def build(type, data)
        # resource locator for report
        case type
        when :main
          SeleniumConnect::Report::MainReport.new data
        when :job
          SeleniumConnect::Report::JobReport.new data
        else
          raise ArgumentError, "Report type \"#{type.to_s}\" unknown!"
        end
      end
    end
  end
end
