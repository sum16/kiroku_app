class RemoveForeignKeyToVitalsAndMedicinesAndMedicalHistories < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :vitals, :care_recipitents
    remove_reference :vitals, :care_recipitent, index: true
  end

  def change
    remove_foreign_key :medicines, :care_recipitents
    remove_reference :medicines, :care_recipitent, index: true
  end
end
