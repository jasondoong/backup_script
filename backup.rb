require 'fileutils'
require_relative 'folder'
require_relative 'sourceTargetPair'

class BackupAction
    
  def initialize(pair)
      @sourceFolder = Folder.new pair.getSource
      @targetFolder = Folder.new pair.getTarget
  end
  
  def backup
      @counter = 0
      @sourceFolder.listAllFiles.each do |file|
          if @targetFolder.isExist?(file)
              next
          else
              puts "Copy file #{file} to dir #{@targetFolder.to_s}"
              @counter = @counter + 1
              @targetFolder.add(file)
          end
      end
  end
  
  def printResult
      if @counter > 1
        puts "back up success, #{@counter} entries are backed up"
      elsif @counter == 1
        puts "back up success, 1 entry is backed up"
      else
        puts "no entries are backed up"
      end
  end
  
end
