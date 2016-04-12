module ROM
  module S3
    class Dataset < SimpleDelegator
      attr_accessor :key_prefix
    end
  end
end
