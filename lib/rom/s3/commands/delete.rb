require 'rom/commands'
require 'rom/commands/delete'

module ROM
  module S3
    module Commands
      class Delete < ROM::Commands::Delete
        adapter :s3

        def execute(tuple)
          obj = relation.dataset.object(set_key(tuple[:object_key]))
          obj.delete()
        end
      end
    end
  end
end
