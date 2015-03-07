# Name of Author: Peter Uherek
# Created at: 3.3. 2015
#
# Description: Interface pre skripty.
# Na vykonanie skriptu je potrebne spustit funkciu Exec_command.

require 'open3'

class CMDInterface

  public
  def Exec_command(cmd)
    if system(cmd)
      return 0 #OK
    else
      return 1 #ERROR
    end
  end

  public
  def Read_output(cmd)
    Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
      puts "stdout is:" + stdout.read
      puts "stderr is:" + stderr.read
    end
  end
end


#Example of execution of script:
#cmd = 'Rscript analyze.r vlado simon'
#puts Exec_command(cmd)