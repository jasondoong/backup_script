
require_relative 'backup'
require 'optparse'

class Main
    DefaultSourcePath = './ori/'
    DefaultTargetPath = './target/'
    
    @pair = nil
    @backupAciton = nil
    @sourceFromUser = nil
    @targetFromUser = nil
    
    def execute
        parseSourceTargetFromUser
        setSourceTarget
        executeBackup
        printExecutionResult
    end
    
    private
    def setSourceTarget
        if(isUserAssignSourceAndTarget)
            setSourceTargetFromUser
        else
            setDefaultSourceTarget
        end
    end
    
    def executeBackup
        initialBackupAction
        executeBackupAction
    end
    
    def printExecutionResult
        @backupAction.printResult
    end
    
    def isUserAssignSourceAndTarget
        if(@sourceFromUser!=nil && @targetFromUser!=nil)
            true
        else
            false
        end
    end
    
    def setSourceTargetFromUser
        @pair = getSourceTargetPair @sourceFromUser, @targetFromUser
    end
    
    def setDefaultSourceTarget
        @pair = getSourceTargetPair DefaultSourcePath, DefaultTargetPath
    end
    
    def initialBackupAction
        @backupAction = BackupAction.new(@pair)
    end
    
    def executeBackupAction
        @backupAction.backup
    end
    
    def getSourceTargetPair(source,target)
        SourceTargetPair.new source, target
    end
    
    def parseSourceTargetFromUser
        OptionParser.new do |opts|
            opts.banner = 'Usage: main.rb [options]'
            opts.on('-h', '--help', 'Help') do
                puts opts
                exit
            end
            
            opts.on('-f', '--from source', 'From which folder') do |source|
                @sourceFromUser = source
            end
            
            opts.on('-t', '--to target', 'To which folder') do |target|
                @targetFromUser = target
            end
            opts.parse!
        end
    end
    
end

m = Main.new.execute