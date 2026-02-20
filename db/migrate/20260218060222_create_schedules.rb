class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.bigint :movie_id, null: false, comment: 'movies.idを参照する外部キー'
      t.time :start_time, null: false, comment: '上映開始時間'
      t.time :end_time, null: false, comment: '上映終了時間'

      t.timestamps
    end

    add_index :schedules, :movie_id
    add_foreign_key :schedules, :movies, column: :movie_id, on_delete: :restrict, on_update: :restrict
  end
end
