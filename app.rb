require 'sinatra'
require 'sinatra/reloader'

# (速度が遅い場合はこちら)
# require "pstore"
# db = PStore.new('chat.db')


require 'yaml/store'
db = YAML::Store.new("chat.db.yaml")

# データベースから取り出す変数は事前にnil初期化
chatlog = nil
money = nil
db.transaction do
  chatlog = db.fetch("chatlog", [])
end
db.transaction do
    money = db.fetch("money", [])
  end



 ## トップページにアクセスするための処理 ##
 get '/' do
   erb :top
 end
 
  ## シフト入力のページにアクセスするための処理 ##
  get '/index' do
     erb :index
  end
  
   ## シフト入力結果画面に遷移 ##
  # resultページにアクセスしたとき
 get '/result' do
  msg = []
  # うけとったメッセージを表示する
  chatlog.each do |ln|

    #puts ln
    msg << "<tr><td>日付 || #{ln["work-day"]}</td><td>　　出勤 || #{ln["work-start"]}</td><td>　　退勤 || #{ln["work-end"]}</td><td>　　休憩開始 || #{ln["break-start"]}</td><td>　　休憩終了 || #{ln["break-end"]}</td><td>　　合計時間 || #{ln["alltime"]}</td></tr>"
  end
  # htmlに引き渡す
  @messages = msg.join("\n")

  erb :result
end
          
        
         
          ## 個人情報ページにアクセスするための処理 ##
          get '/mypage' do
             erb :mypage
          end  



## index.erbでシフト入力した情報を受け取る処理 ##
post '/result' do
  # webから受け取るメッセージ
  # <input name ="content">の内容をうけとりたいとき
  aa = params['work-day']
  bb = params['work-start']
  cc = params['work-end']
  dd = params['break-start']
  ee = params['break-end']
  
  
  bh, bm = bb.split(":").map{|x| x.to_i}
  ch, cm = cc.split(":").map{|x| x.to_i}
  dh, dm = dd.split(":").map{|x| x.to_i}
  eh, em = ee.split(":").map{|x| x.to_i}

  t = ch * 60 + cm - bh * 60 - bm - (eh * 60 + em - dh * 60 - dm)

  gg = "%002d"%(t/60) + ":" + "%002d"%(t%60)

  hash = {"work-day"=> aa,"work-start"=> bb, "work-end"=> cc,"break-start"=> dd,"break-end"=> ee ,"alltime" => gg}
  # 保存する
  # ログデータに追加
  chatlog.push hash

  # ここでdb[キー] に代入すると書き込まれる
  db.transaction do
    db["chatlog"] = chatlog
  end

  # ファイルに保存する
  # resultページに遷移させる
  redirect '/result'
  
end

post '/mypage' do
    ff = params['salary']

    money = ff.to_i

    db.transaction do
        db["money"] = money
    end

    redirect '/'
end

get '/money' do

    sum = 0

    chatlog.each do |ln|
        time = ln["alltime"].split(":").map{|x| x.to_i}
        n = time[0] * 60 + time[1]
        sum += n
    end

    @times = "%002d"%(sum/60) + "時間" + "%002d"%(sum%60) + "分"
    @sum = sum * money / 60

    erb:money
end

 
 






