Puppet::Parser::Functions::newfunction(:make_res, :doc => <<-EOS
make some resources
    EOS
) do |argv|

  type_name = argv[0]
  title = '/tmp/make_res.txt'
  
  # сначала создаем обект ТИП или находим определение по имени
  if resource = Puppet::Type.type(type_name.to_sym)
    type_of_resource = :type
  elsif resource = find_definition(type_name.downcase)
    type_of_resource = :define
  else
    raise ArgumentError, "could not create resource of unknown type #{type_name}"
  end

  # это параметры ресурса
  resource_params = { :ensure => :present }

  # теперь создаем РЕСУРС передав ему его тип, титул и ранее созданный объект ТИП
  p_resource = Puppet::Parser::Resource.new(type_name, title, :scope => self, :source => resource)

  # теперь добавляем к нему каждый из его параметров
  resource_params.each do |k,v|
    p_resource.set_parameter(k,v)
  end

  # если это было определение, то надо создать экземпляр зачем-то
  if type_of_resource == :define then
    resource.instantiate_resource(self, p_resource)
  end

  # а теперь добавим РЕСУРС в каталог
  compiler.add_resource(self, p_resource)

end
