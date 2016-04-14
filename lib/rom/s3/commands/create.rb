require 'rom/commands'
require 'rom/commands/create'

module ROM
  module S3
    module Commands
      class Create < ROM::Commands::Create
        adapter :s3

        def execute(tuples)
          tuples.each do |tuple|
            obj = relation.dataset.object("#{relation.dataset.key_prefix}/#{tuple[:entity_type]}/#{tuple[:entity_id]}" + tuple[:entity_extension] && tuple[:entity_extension].size > 0 ? tuple[:entity_extension] : '.txt')
            obj.put(body: tuple[:entity_body])
          end
        end
      end
    end
  end
end
