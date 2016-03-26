require 'erb'
require 'fileutils'

module Net
  module KernelPicnic
    module Scaffold
      module Service
        # Provides methods to assist with the installation of the Scaffold service.
        module Install
          SERVICE_NAME = 'scaffold'.freeze

          # Installs a systemd compatible init script for Meteor.
          # Params:
          def self.systemd
            path = File.join('/etc/init.d', SERVICE_NAME)

            # TODO: This is horrible.
            template = File.join(
              File.dirname(File.realpath(__FILE__)),
              '../../../../../../templates/init/systemd.erb'
            )

            begin
              template = File.read(template)
            rescue => e
              raise e
            end

            # TODO: Perform ERB actions here.

            # Write template and mark as executable.
            begin
              File.open(path, 'w') do |f|
                f.write(template)
              end
              FileUtils.chmod(0755, path)
            rescue => e
              raise e
            end

            # Install the script.
            begin
              system('update-rc.d', SERVICE_NAME, 'defaults')
            rescue => e
              raise e
            end
          end
        end
      end
    end
  end
end
