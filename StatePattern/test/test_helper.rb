$LOAD_PATH.unshift( File.join( File.dirname(__FILE__), '..', 'lib' ) )

%w{test/unit concrete_}.each { |x| require x }
