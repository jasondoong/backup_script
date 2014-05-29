class SourceTargetPair
  def initialize(source, target)
    @sourcePath = source
    @targetPath = target
  end
  
  def getSource
    @sourcePath
  end

  def getTarget
    @targetPath
  end  
end