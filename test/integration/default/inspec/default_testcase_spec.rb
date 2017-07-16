describe file('/opt/spring-boot/spring-boot-app/configs.conf') do
  it { should be_owned_by 'root' }
end
