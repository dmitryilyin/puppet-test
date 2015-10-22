Puppet::Type.newtype(:myfile) do
  ensurable

  newparam(:name) do
    isnamevar
  end

end
