# encoding: utf-8
# author: Hilal Jaffan
describe directory('/opt/spring-boot') do
  its('mode') { should cmp '0755' }
end
describe directory('/opt/spring-boot/spring-boot-app/') do
  its('mode') { should cmp '0755' }
end
describe file('/opt/spring-boot/spring-boot-app/config.properties') do
  it { should be_owned_by 'root' }
  its('content') { should match(%r{prop1.prop2.username = user(.*)}) }
  its('content') { should match(%r{prop1.prop2.password = pass(.*)}) }
end
describe file('/opt/spring-boot/spring-boot-app/configs.conf') do
  it { should be_owned_by 'root' }
  its('content') { should match(%r{JAVA_HOME(.*)}) }
  its('content') { should match(%r{RUN_ARGS(.*)}) }
end
