require_relative 'backup'

sourcePath = './ori/'
targetPath = './target/'

pair = SourceTargetPair.new(sourcePath, targetPath)

backupAction = BackupAction.new(pair)
backupAction.backup
backupAction.printResult
