module ROM
  module S3
    module CommandsHelper
      def set_key(key)
        if key.nil? || key.blank?
          object_key = Date.today.strftime('%m%d%Y').to_s
        else
          object_key = key
        end
        object_key
      end
    end
  end
end
