require 'jekyll-assets'

# Ensure compatibility with Jekyll 4 which expects static files to respond to `write?`
if defined?(Sprockets::StaticAsset)
  unless Sprockets::StaticAsset.method_defined?(:write?)
    module Sprockets
      class StaticAsset
        def write?
          true
        end
      end
    end
  end

  unless Sprockets::StaticAsset.method_defined?(:path)
    module Sprockets
      class StaticAsset
        # Jekyll 4 expects static files to respond to `path`
        def path
          if respond_to?(:pathname) && pathname
            pathname.to_s
          elsif respond_to?(:filename)
            filename.to_s
          elsif respond_to?(:logical_path)
            logical_path.to_s
          else
            to_s
          end
        end
      end
    end
  end
end

# Also patch BundledAsset which Jekyll may iterate over as a static file
if defined?(Sprockets::BundledAsset)
  unless Sprockets::BundledAsset.method_defined?(:write?)
    module Sprockets
      class BundledAsset
        def write?
          true
        end
      end
    end
  end

  unless Sprockets::BundledAsset.method_defined?(:path)
    module Sprockets
      class BundledAsset
        def path
          if respond_to?(:pathname) && pathname
            pathname.to_s
          elsif respond_to?(:filename)
            filename.to_s
          elsif respond_to?(:logical_path)
            logical_path.to_s
          else
            to_s
          end
        end
      end
    end
  end
end
