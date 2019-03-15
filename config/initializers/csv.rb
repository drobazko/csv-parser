# Add utf8_encoded converters for headers and fields
require 'csv'

converter = ->(field) { field.encode('utf-8', invalid: :replace, undef: :replace, replace: '') }

CSV::Converters[:utf8_encoded] = converter
CSV::HeaderConverters[:utf8_encoded] = converter
