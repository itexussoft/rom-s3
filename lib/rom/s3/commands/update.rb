require 'rom/commands'
require 'rom/commands/update'
require 'rom/s3/commands/commands_helper'

module ROM
  module S3
    module Commands
      class Update < ROM::Commands::Update
        adapter :s3

        include CommandsHelper

        def execute(tuple)
          obj = relation.dataset.object(set_key(tuple[:object_key]))
          obj.put(body: tuple[:body])
        end
      end
    end
  end
end
