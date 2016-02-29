class ReportCard
  def initialize(student)
    @student = student
  end

  def generate(student)
    Logger.log_report_card(student) if average <= 50
  end

  def average
    grades = @student.grades
    grades.inject{ |sum, el| sum + el }.to_f / grades.size
  end

end
