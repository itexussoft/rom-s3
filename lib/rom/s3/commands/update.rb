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
          obj = relation.dataset.object(dataset.key_prefix + set_key(tuple[:entity_id], tuple[:entity_type])
          obj.put(body: tuple[:body])
        end
      end
    end
  end
end
