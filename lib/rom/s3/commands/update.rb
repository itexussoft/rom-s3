require 'rom/commands'
require 'rom/commands/update'

module ROM
  module S3
    module Commands
      class Update < ROM::Commands::Update
        adapter :s3

        def execute(tuple)
          obj = relation.dataset.object("#{relation.dataset.key_prefix}/#{tuple[:entity_type]}/#{tuple[:entity_id]}" + tuple[:entity_extension].present? ? tuple[:entity_extension] : '.txt')
          obj.put(body: tuple[:body])
        end
      end
    end
  end
end
