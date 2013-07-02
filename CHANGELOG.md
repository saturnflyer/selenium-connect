#2.1.0 (2013-07-02)

#2.0.0 (2013-06-27)
- Added selenium server jar as explicit dependency
- Updated ruby version
- Updated logging tests

#1.9.3 (2013-06-21)
- Merge branch 'release/1.9.3'
- Bumping to 1.9.3 since rubygems is giving me guff about 1.9.2 already existing, even though the upload failed halfway through.
- Merge branch 'release/1.9.2' into develop
- Merge branch 'release/1.9.2'
- Bumped version and description
- Nefarious. Tests passed running in this dir but failed in the wild. Needed to incorporate Dir.getwd into the mix to capture log output properly.
- Merge branch 'release/1.9.1'
- Bumped to 1.9.1
- Removed the rake task from the repo since it is dynamically generated
- Refactored the test structure so it is not redundant and assertions are separated.
- Cleaned up some cruft
- Added rake tasks to gitignore
- Removed the default setter for logs since this is covered in the local server runner
- Added .gem to the gitignore
- Merge branch 'release/1.9.0'
- Bumped version number to 1.9.0 and added description
- Added a build dir with a shadow file so it stays put on github (for future committers to run tests without setup). Broke out the specs into separate files since they were getting a bit long in the tooth. Reworked the PhantomJS runner so it works with the existing Remote pattern matching after adding the requisite phantomjs binary to the project bin dir and adding the necessary capabilities in the runner.
- removed chromedriver.log
- started fleshing out a more consolidated log folder and option for such, got the firefox to output its log file to that folder.
- back merged master into develop to keep inline with git flow, added a blank changelog file and minor tweeks to the docs
- Merge branch 'master' into develop
- Merge pull request #4 from arrgyle/feature/headless
- added a phantomjs browser with spec
- Set sauce gem version to pre-3 since new version is causing hiccups to do a new dependency, and potentially other lurking breaking changes

#1.8.0 (2013-05-28)
- Bumped to version 1.8.0
- Added better chrome support by adding the chromedriver to bin. Setting browser to chrome and host to localhost will run things locally now via the remote webdriver.
- Bumped version to 1.7 for yaml config support

#1.7.0 (2013-05-22)
- Initial pass on adding yaml config file support

#1.6.0 (2013-05-15)
- Bumped version number and updated description
- Added sauce to support list
- Removed un-needed require from test
- Initial assumptions of the location being needed for sauce and localhost were proven false since the sauce gem actually instantiates a driver object. So, backed out the location stuff and added saucelabs as a runner.
- Chased down a bug where configs were not getting passed properly. This was due to an overzealous find replace made earlier today. Fixed.
- Things are stubbed -- test has basic config hooks I want to pass, and the code is abstracted and waiting for sauce gem specific bits. Splunkingi through their code now.
- Abstracted out location checking and execution for easy extension to account for local server runs and sauce labs integration.
- Removed a rogue puts, and tested logging fix (which was addressed in previous commit). Fixes #3
- Refactoring complete for browser selection
- Added missing requires
- Added Chrome and NoBrowser objects. Initial attempt at refactoring to remove the case statement in runner.
- Fixed a bug in the firefox binary path setter, and bumped the version to 1.5.1

#1.5.0 (2013-05-13)
- Bumped version to 1.5.0
- Added firefox binary path as a config parameter for local testing.

#1.4.0 (2013-05-10)
- Added IE support and abstracted the firefox and ie runners into a runner directory.
- Updated spec for some pending actions
- *sigh* I always forget the -a
- Abstracted Firefox functionality out into its own class within Runner. Also added scaffolding for IE support. Lastly, fixed a bug by removing a hard-code dependency to the Remote::Bridge class which was done based on a faulty assumption.
- Minor tweak to the readme

#1.3.0 (2013-05-09)
- Bumping version to 1.3.0
- Added a test for logging, and updated the server to properly wrap the logging parameter on rake task creation -- fixes #2. Also caught a bug introduced with the previous profile commit -- fixed with a small nil check.
- Added profile name selection for firefox and cleaned up the tests a bit. Also fixed the default configuration params setter, fixes #1
- Ported example.rb into an RSpec spec, and added rspec as a development dependency in the gemspec
- Removed Gemfile.lock from the repo per recommendations from jwieringa and radar in https://github.com/arrgyle/chemistrykit/pull/14
- Got schooled by Jim Gay that == returns true or false, so no ternary or then action required. Hella simplified.
- Switched out the if/then in localhost? to a ternary operator
- Merge branch 'master' of https://github.com/arrgyle/selenium-connect
- Simplified the localhost method based on Jim Gay's feedback
- Bumping badget to the right of the title
- Adding Code Climate badge.
- Bumped version for bug fix
- Moved sensible defaults setting from runner into configuration
- Renamed all of the bits to selenium-connect
- Sanitizing.

#v.1.2.0 (2013-04-18)

#1.1.0 (2013-04-18)

#1.0.0 (2013-04-18)
- Initial Release
