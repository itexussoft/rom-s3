require 'rom/commands'
require 'rom/commands/create'

module ROM
  module S3
    module Commands
      class Create < ROM::Commands::Create
        adapter :s3

        def execute(tuples)
          tuples.each do |tuple|
            entity_extension = set_extension(tuple[:entity_extension])
            obj = relation.dataset.object("#{relation.dataset.key_prefix}/#{tuple[:entity_type]}/#{tuple[:entity_id]}" + entity_extension)
            obj.put(body: tuple[:entity_body])
          end
        end

        def set_extension(extension)
          ext = '.txt'
          if extension && extension.size > 0
            ext = extension
          end
          ext
        end
      end
    end
  end
end
