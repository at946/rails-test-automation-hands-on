feature "User story", type: :system do
  before :each do
    # モデルの作成など各シナリオ前に共通的に実行させたい処理
    # ここで作成されたモデルはシナリオ毎にクリアされる（シナリオ内で作成されたモデルも）
  end

  scenario "受入条件１" do
    # test code
  end

  scenario "受入条件2" do
    # test code
  end
end
