describe file('/opt/spring-boot/spring-boot-app/configs.conf') do
  it { should MATCHER 'JAVA_HOME' }
end
