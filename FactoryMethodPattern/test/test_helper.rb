$LOAD_PATH.unshift( File.join( File.dirname(__FILE__), '..', 'lib' ) )

%w{test/unit operation concrete_operation operation_factory}.each { |x| require x }
