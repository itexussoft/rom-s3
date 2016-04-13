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
          tuples.each do |tuple|
            obj = relation.dataset.object(dataset.key_prefix + set_key(tuple[:entity_id], tuple[:entity_type])
            obj.put(body: tuples[:entity_body])
          end
        end
      end
    end
  end
end
