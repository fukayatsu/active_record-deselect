require "active_record/deselect/version"

module ActiveRecord
  module Deselect
    def deselect(*deselect_columns)
      scope = current_scope || relation
      select_columns = filter_columns(scope, deselect_columns)
      scope.except(:select).select(select_columns)
    end

    def deselect!(*deselect_columns)
      scope = current_scope || relation
      select_columns = filter_columns(scope, deselect_columns)
      scope.select_values = select_columns
      scope
    end

  private

    def filter_columns(scope, deselect_columns)
      current_columns  = scope.select_values.presence || column_names.map(&:to_sym)
      deselect_columns = deselect_columns.map{ |column|
        column = column.to_s
        column.include?('.') ? [column] : [column, "#{table_name}.#{column}"]
      }.flatten.map{ |column|
        [column.to_s, column.to_sym]
      }.flatten

      current_columns - deselect_columns
    end
  end
end

ActiveRecord::Querying.send(:include, ActiveRecord::Deselect)
