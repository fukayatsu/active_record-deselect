require "active_record/deselect/version"

module ActiveRecord
  module Deselect
    def deselect(*columns)
      s = current_scope || relation

      select_columns = (s.select_values.presence || column_names.map(&:to_sym)) -
        columns.map{ |column|
          column = column.to_s
          column.include?('.') ? [column] : [column, "#{table_name}.#{column}"]
        }.flatten.map{ |column|
          [column.to_s, column.to_sym]
        }.flatten

      s.except(:select).select(select_columns)
    end
  end
end

ActiveRecord::Querying.send(:include, ActiveRecord::Deselect)
