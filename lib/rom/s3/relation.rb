require 'rom/relation'

module ROM
  module S3
    # Relation subclass of S3 adapter
    #
    # @example
    #   class Users < ROM::Relation[:s3]
    #   end
    #
    # @api public
    class Relation < ROM::Relation
      adapter :s3

      def count
        raise UnsupportedOperationError
      end
    end
  end
end
