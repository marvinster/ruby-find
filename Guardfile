
guard 'rspec', cmd: 'bundle exec rspec' do
  # run every updated spec file
  watch(/^spec\/.+_spec\.rb$/)
  # run the lib specs when a file in lib/ changes
  watch(/^lib\/(.+)\.rb$/) { |m| "spec/lib/#{m[1]}_spec.rb" }
  # run the model specs related to the changed model
  watch(/^app\/(.+)\.rb$/) { |m| "spec/#{m[1]}_spec.rb" }
  # run the view specs related to the changed view
  watch(/^app\/(.*)(\.erb|\.haml)$/) { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  # run the integration specs related to the changed controller
  watch(%r{^app/controllers/(.+)_(controller)\.rb}) do
    |m| "spec/requests/#{m[1]}_spec.rb"
  end
  # run the integration specs related to the changed view
  watch(%r{^app/views/(.+)/.*\.(erb|haml|jbuilder)$}) do
    |m| "spec/requests/#{m[1]}_spec.rb"
  end
  # run all integration tests when application controller change
  watch('app/controllers/application_controller.rb') { 'spec/requests' }
end
