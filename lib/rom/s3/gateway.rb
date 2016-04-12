require 'rom/gateway'
require 'rom/s3/commands'

# Ruby Object Mapper
#
# @see http://rom-rb.org/
module ROM
  # Amazon S3 support for ROM
  #
  # @example
  #   require 'rom/s3'
  #   require 'ostruct'
  #
  #   setup = ROM.setup(:s3, "path/to/bucket")
  #   setup.relation(:users) do
  #     def by_name(name)
  #       dataset.find_all { |row| row[:name] == name }
  #     end
  #   end
  #
  #   class User < OpenStruct
  #   end
  #
  #   setup.mappers do
  #     define(:users) do
  #       model User
  #     end
  #   end
  #
  #   rom = setup.finalize
  #   p rom.read(:users).by_name('Jane').one
  #   # => #<User id=2, name="Jane", email="jane@doe.org">
  #
  #
  # @api public
  module S3
    # Amazon S3 gateway interface
    #
    # @api public
    class Gateway < ROM::Gateway
      # Expect options
      # @param options [Hash] options
      #
      # @api private
      #
      def initialize(options = {})
        @options = options
      end

      # Return dataset with the given name
      #
      # @param name [String] dataset name
      # @return [Dataset]
      #
      # @api public
      def [](name)
        s3_bucket(name)
      end

      # Register a dataset in the gateway
      #
      # If dataset already exists it will be returned
      #
      # @param name [String] dataset name
      # @return [Dataset]
      #
      # @api public
      def dataset(name)
        dataset = ROM::S3::Dataset.new(s3_bucket(name))
        dataset.key_prefix = @options[:key_prefix] if @options[:key_prefix]
        dataset
      end

      # Check if Amazon S3 bucket exists
      #
      # @param name [String] Amazon S3 bucket name
      #
      # @api public
      def dataset?(name)
        s3_bucket(name).exists?
      end

      private
      def s3_bucket(name)
        @client ||= Aws::S3::Client.new(
                                      credentials: Aws::Credentials.new(@options[:access_key], @options[:secret_key]),
                                      region: @options[:region])

        @resource ||= Aws::S3::Resource.new(client: @client)
        @resource.bucket(name)
      end
    end
  end
end
