# Sass Precompiler Plugin for Jekyll
# Compiles Sass files before Jekyll build to enable ministamp fingerprinting

Jekyll::Hooks.register :site, :post_read do |site|
  # Always run the precompiler
  # This ensures CSS is available for ministamp during both development and production

  puts 'Pre-compiling Sass files...'

  # Create _tmp directory if it doesn't exist
  tmp_dir = File.join(site.source, '_tmp')
  FileUtils.mkdir_p(tmp_dir)

  # Compile main application.scss using sass CLI
  sass_file = File.join(site.source, '_sass', 'application.scss')
  css_file = File.join(tmp_dir, 'application.css')

  if File.exist?(sass_file)
    begin
      # Use sass CLI command
      cmd = "sass #{sass_file} #{css_file} --style=compressed"
      success = system(cmd)

      if success && File.exist?(css_file)
        puts "✓ Compiled #{sass_file} → #{css_file}"
      else
        puts '✗ Error compiling Sass: command failed'
        raise 'Sass compilation failed'
      end
    rescue StandardError => e
      puts "✗ Error compiling Sass: #{e.message}"
      raise e
    end
  else
    puts "✗ Sass file not found: #{sass_file}"
  end
end

# NOTE: Jekyll's built-in file watching will automatically detect changes
# to Sass files and trigger regeneration, which will re-run this plugin
