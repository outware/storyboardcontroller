# Example:
#
# Rake::Task["jenkins:dev"].overwrite do
#   # Do nothing
# end

class Rake::Task
  def overwrite(&block)
    @actions.clear
    enhance(&block)
  end
end
