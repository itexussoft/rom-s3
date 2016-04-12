require 'rom'
require 'rom/s3/version'
require 'rom/s3/gateway'
require 'rom/s3/relation'
require 'rom/s3/unsupported_operation_error'

ROM.register_adapter(:s3, ROM::S3)
