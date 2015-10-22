Puppet::Type.type(:myfile).provide(:myfile) do
  def exists?
    false
  end

  def create
    true
  end

  def destroy
    true
  end
end
