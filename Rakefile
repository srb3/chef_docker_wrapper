desc 'lint, build artifact and test in kitchen, upload to unstable channel if test pass'
task :build_test_stable do
  Rake::Task['lint:cs'].execute
  Rake::Task['lint:fc'].execute
  Rake::Task['hab:hb'].execute
  Rake::Task['kitchen:kd'].execute
  Rake::Task['kitchen:kc'].execute
  Rake::Task['kitchen:kcc'].execute
  Rake::Task['kitchen:kv'].execute
  Rake::Task['kitchen:kd'].execute
  Rake::Task['hab:uu'].execute
end

desc 'lint, build artifact and test in kitchen, upload to stable channel if test pass'
task :build_test_unstable do
  Rake::Task['lint:cs'].execute
  Rake::Task['lint:fc'].execute
  Rake::Task['hab:hb'].execute
  Rake::Task['kitchen:kd'].execute
  Rake::Task['kitchen:kc'].execute
  Rake::Task['kitchen:kcc'].execute
  Rake::Task['kitchen:kv'].execute
  Rake::Task['kitchen:kd'].execute
  Rake::Task['hab:us'].execute
end

desc 'just lint'
task :lint do
  Rake::Task['lint:cs'].execute
  Rake::Task['lint:fc'].execute
end

desc 'lint and kitchen destroy, create, test, destroy'
task :test do
  Rake::Task['lint:cs'].execute
  Rake::Task['lint:fc'].execute
  Rake::Task['kitchen:kd'].execute
  Rake::Task['kitchen:kc'].execute
  Rake::Task['kitchen:kcc'].execute
  Rake::Task['kitchen:kv'].execute
  Rake::Task['kitchen:kd'].execute
end

desc 'destroy, create and test'
task :kitchen_test do
  Rake::Task['kitchen:kd'].execute
  Rake::Task['kitchen:kc'].execute
  Rake::Task['kitchen:kcc'].execute
  Rake::Task['kitchen:kv'].execute
  Rake::Task['kitchen:kd'].execute
end

desc 'create and test'
task :kitchen_test_dirty do
  Rake::Task['kitchen:kc'].execute
  Rake::Task['kitchen:kcc'].execute
  Rake::Task['kitchen:kv'].execute
  Rake::Task['kitchen:kd'].execute
end

namespace :lint do
  desc 'cookstyle'
  task :cs do
    sh 'cookstyle .'
  end

  desc 'foodcritic'
  task :fc do
    sh 'foodcritic .'
  end
end

def kitchen_cmd
  if ENV['KITCHEN_YAML']
    "KITCHEN_YAML=#{ENV['KITCHEN_YAML']} kitchen"
  else
    'KITCHEN_YAML=kitchen.local.yml kitchen'
  end
end

namespace :kitchen do
  desc 'kitchen create'
  task :kc do
    sh "#{kitchen_cmd} create"
  end

  desc 'kitchen converge'
  task :kcc do
    sh "#{kitchen_cmd} converge"
  end

  desc 'kitchen test'
  task :kv do
    sh "#{kitchen_cmd} verify"
  end

  desc 'kitchen destroy'
  task :kd do
    sh "#{kitchen_cmd} destroy"
  end
end

namespace :hab do
  desc 'build'
  task :hb do
    sh 'hab pkg build .'
  end

  desc 'upload unstable'
  task :uu do
    sh <<~EOF
     . results/last_build.env
     hab pkg upload results/$pkg_artifact
    EOF
  end

  desc 'upload stable'
  task :us do
    sh <<~EOF
     . results/last_build.env
     hab pkg upload results/$pkg_artifact --channel stable
    EOF
  end
end
