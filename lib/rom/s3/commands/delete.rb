require 'rom/commands'
require 'rom/commands/delete'

module ROM
  module S3
    module Commands
      class Delete < ROM::Commands::Delete
        adapter :s3

        def execute(tuple)
          obj = relation.dataset.object("#{relation.dataset.key_prefix}/#{tuple[:entity_type]}/#{tuple[:entity_id]}" + tuple[:entity_extension].present? ? tuple[:entity_extension] : '.txt')
          obj.delete()
        end
      end
    end
  end
end
