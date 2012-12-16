current_dir = Dir.pwd
tmp_dir = File.join current_dir, "tmp"
file_cache_path tmp_dir
cookbook_path %w(cookbooks site-cookbooks).map{ |x| File.join(current_dir, x) }
cache_options :path => File.join(tmp_dir, "checksums")
