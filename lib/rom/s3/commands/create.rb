require 'rom/commands'
require 'rom/commands/create'
require 'rom/s3/commands/commands_helper'

module ROM
  module S3
    module Commands
      class Create < ROM::Commands::Create
        adapter :s3

        include CommandsHelper

        def execute(tuples)
          obj = relation.dataset.object(set_key(tuples[:object_key])
          obj.put(body: tuples[:body])
        end
      end
    end
  end
end
