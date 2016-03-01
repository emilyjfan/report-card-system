require './report_card'
require './logger'

RSpec.describe ReportCard do
  describe '#average' do
    it 'calculates the student\'s average grade' do
      student = double('student')
      allow(student).to receive(:grades).and_return([80, 90, 70, 80])
      report_card = ReportCard.new(student)

      expect(report_card.average).to eq(80)
    end
  end

  describe '#generate' do
    context 'when the student is failing' do
      it 'logs a message' do
        student = double('student', :grades => [30, 40, 50, 40])
        expect(Logger).to receive(:log_report_card).with(student)
        report_card = ReportCard.new(student)

        report_card.generate(student)
      end
    end

    context 'when the student is passing' do
      it 'does not log a message' do
        student = double('student', :grades => [80, 70, 80, 90])
        expect(Logger).to_not receive(:log_report_card)
        report_card = ReportCard.new(student)

        report_card.generate(student)
      end
    end
  end

end