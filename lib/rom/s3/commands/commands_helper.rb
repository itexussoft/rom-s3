module ROM
  module S3
    module CommandsHelper
      def set_key(entity_id, entity_type)
        if (entity_type.nil? || entity_type.blank?) && (entity_id.nil? || entity_.blank?)
          object_key = Date.today.strftime('%m%d%Y').to_s
        else
          object_key = "#{entity_id}_#{entity_type}"
        end
        object_key
      end
    end
  end
end
