$LOAD_PATH.unshift( File.join( File.dirname(__FILE__), '..', 'lib' ) )

%w{test/unit company subject observer concrete_subject concrete_observer}.each { |x| require x }
