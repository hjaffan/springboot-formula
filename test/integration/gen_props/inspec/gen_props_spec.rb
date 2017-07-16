# encoding: utf-8
# author: Hilal Jaffan

describe file('/opt/spring-boot/spring-boot-app/configs.conf') do
  it { should be_owned_by 'root' }
  its('content') { should match(%r{JAVA_HOME(.*)}) }
  its('content') { should match(%r{LOG_FOLDER(.*)}) }
end

describe directory('/opt/spring-boot') do
  its('mode') { should cmp '0755' }
end

describe directory('/opt/spring-boot/spring-boot-app/') do
  its('mode') { should cmp '0755' }
end
