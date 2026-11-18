<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>不同客群的需求 - 咖啡店行銷簡報</title>
    <style>
        /* 視覺與顏色設定：米白底、深綠文字、綠色按鈕、淡黃提示、白色圓角卡片 */
        :root {
            --bg-color: #F9F9F4; /* 米白底 */
            --text-color: #1A3A22; /* 深綠文字 */
            --btn-color: #2D7A4F; /* 綠色按鈕 */
            --btn-hover: #1E5C3A;
            --btn-disabled: #A5C2B1;
            --card-bg: #FFFFFF; /* 白色卡片 */
            --hint-bg: #FFF9D2; /* 淡黃提示 */
            --border-radius: 12px;
            --focus-outline: 3px solid #2D7A4F;
        }

        * {
            box-sizing: border-box;
            font-family: "Helvetica Neue", Arial, "LiHei Pro", "微軟正黑體", sans-serif;
        }

        body {
            margin: 0;
            padding: 0;
            background-color: var(--bg-color);
            color: var(--text-color);
            line-height: 1.6;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        /* 清楚的大字與留白 */
        h1, h2, h3 {
            color: var(--text-color);
            margin-top: 0;
            line-height: 1.3;
        }

        h1 { font-size: 2.2rem; margin-bottom: 0.5rem; }
        h2 { font-size: 1.8rem; margin-bottom: 1.5rem; }
        p { font-size: 1.2rem; }

        /* 進度條 */
        #progress-container {
            width: 100%;
            height: 6px;
            background-color: #E0E4E1;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 100;
        }

        #progress-bar {
            height: 100%;
            background-color: var(--btn-color);
            width: 33.33%;
            transition: width 0.3s ease;
        }

        /* 導覽列 (頁次) */
        header {
            text-align: center;
            padding: 20px 20px 10px;
            margin-top: 10px;
            font-size: 1.1rem;
            font-weight: bold;
            color: var(--btn-color);
        }

        /* 內容區 */
        main {
            flex: 1;
            max-width: 900px;
            margin: 0 auto;
            padding: 20px 30px;
            width: 100%;
        }

        .page {
            display: none;
            animation: fadeIn 0.4s;
        }

        .page.active {
            display: block;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* 桌面卡片並排，手機上下排列 */
        .card-group {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            background-color: var(--card-bg);
            border-radius: var(--border-radius);
            padding: 25px;
            flex: 1;
            box-shadow: 0 4px 12px rgba(0,0,0,0.06);
            border: 1px solid #EBEBEB;
        }

        .card-title {
            font-size: 1.4rem;
            font-weight: bold;
            margin-bottom: 10px;
            color: var(--btn-color);
        }

        /* 客群比較專用排版 */
        .compare-row {
            display: flex;
            align-items: center;
            background: var(--bg-color);
            padding: 10px;
            border-radius: 8px;
            margin-top: 10px;
            font-weight: bold;
        }

        .compare-arrow {
            margin: 0 10px;
            color: var(--btn-color);
        }

        /* 測驗選項設計 */
        #quiz-options {
            display: flex;
            flex-direction: column;
            gap: 15px;
            margin: 20px 0;
        }

        .quiz-option {
            background-color: var(--card-bg);
            border: 2px solid #EBEBEB;
            border-radius: var(--border-radius);
            padding: 18px 20px;
            font-size: 1.2rem;
            cursor: pointer;
            transition: all 0.2s;
            text-align: left;
            color: var(--text-color);
            box-shadow: 0 2px 6px rgba(0,0,0,0.04);
        }

        /* 按鈕容易點選，鍵盤焦點清楚 */
        .quiz-option:focus-visible, button:focus-visible {
            outline: var(--focus-outline);
            outline-offset: 2px;
        }

        .quiz-option:hover:not(:disabled) {
            border-color: var(--btn-color);
            background-color: #F0F7F3;
        }

        .quiz-option.selected {
            border-color: var(--btn-color);
            background-color: #E8F2EC;
            box-shadow: 0 0 0 1px var(--btn-color);
        }

        .quiz-option:disabled {
            cursor: default;
            opacity: 0.8;
        }

        /* 反饋區域 */
        #feedback-box {
            display: none;
            margin-top: 20px;
            padding: 20px;
            border-radius: var(--border-radius);
            font-size: 1.15rem;
            animation: fadeIn 0.3s;
        }

        .feedback-hint {
            background-color: var(--hint-bg);
            border: 1px solid #E5D577;
        }

        .feedback-success {
            background-color: #E8F2EC;
            border: 1px solid var(--btn-color);
        }

        /* 導覽按鈕 */
        footer {
            max-width: 900px;
            margin: 0 auto;
            width: 100%;
            padding: 20px 30px 40px;
            display: flex;
            justify-content: space-between;
        }

        .btn {
            background-color: var(--btn-color);
            color: white;
            border: none;
            padding: 12px 28px;
            font-size: 1.2rem;
            font-weight: bold;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .btn:hover:not(:disabled) {
            background-color: var(--btn-hover);
        }

        .btn:disabled {
            background-color: var(--btn-disabled);
            cursor: not-allowed;
        }
        
        .btn-outline {
            background-color: transparent;
            color: var(--btn-color);
            border: 2px solid var(--btn-color);
            margin-top: 15px;
        }
        
        .btn-outline:hover:not(:disabled) {
            background-color: var(--btn-color);
            color: white;
        }

        /* RWD 響應式：手機版排列 */
        @media (max-width: 650px) {
            .card-group {
                flex-direction: column;
            }
            h1 { font-size: 1.8rem; }
            h2 { font-size: 1.5rem; }
            p { font-size: 1.1rem; }
            .compare-row { flex-direction: column; align-items: flex-start; }
            .compare-arrow { transform: rotate(90deg); margin: 5px 0; }
        }
    </style>
</head>
<body>

    <!-- 頂部進度條 -->
    <div id="progress-container">
        <div id="progress-bar"></div>
    </div>

    <!-- 頁次顯示 -->
    <header>
        <span id="page-indicator">1 / 3 頁</span>
    </header>

    <main>
        <!-- 第一頁：介紹即將開幕的咖啡店與客群觀察 -->
        <section id="page-1" class="page active">
            <h1>校園咖啡店開幕：你了解你的客人嗎？</h1>
            <p>虛構的校園咖啡店即將開幕！店長原本只想用<strong>「我們的咖啡很好喝」</strong>來吸引客人。</p>
            <p>但是，不同的客人有不同的煩惱與需求。讓我們來看看這兩種常見的學生客群：</p>
            
            <div class="card-group">
                <div class="card">
                    <div class="card-title">🏃‍♂️ 趕著上早八的學生</div>
                    <p><strong>他們的情況：</strong>快要遲到了，分秒必爭！</p>
                    <p><strong>他們的需求：</strong>需要快速取餐，且價格必須合適，沒有時間慢慢排隊等候。</p>
                </div>
                <div class="card">
                    <div class="card-title">📚 討論報告的學生</div>
                    <p><strong>他們的情況：</strong>期末考週，需要小組開會討論。</p>
                    <p><strong>他們的需求：</strong>需要有座位、提供插座，以及可以適度交談的合適空間。</p>
                </div>
            </div>
        </section>

        <!-- 第二頁：比較兩種客群需求與訴求的差異 -->
        <section id="page-2" class="page">
            <h2>先選對象，再決定訴求</h2>
            <p>清楚目標客群是誰，我們才能給出精準的「訴求」。來比較一下這兩種客群的需求差異：</p>
            
            <div class="card-group">
                <div class="card">
                    <div class="card-title">🏃‍♂️ 客群 A：趕時間的學生</div>
                    <div class="compare-row">
                        <span><strong>需求：</strong>快速取得咖啡</span>
                        <span class="compare-arrow">➔</span>
                        <span><strong>對應訴求：</strong><br>預先點餐、快速取餐、清楚價格</span>
                    </div>
                </div>
                <div class="card">
                    <div class="card-title">📚 客群 B：討論報告的學生</div>
                    <div class="compare-row">
                        <span><strong>需求：</strong>需要討論環境</span>
                        <span class="compare-arrow">➔</span>
                        <span><strong>對應訴求：</strong><br>舒適座位、提供插座、適合交談的空間</span>
                    </div>
                </div>
            </div>
            <p style="margin-top:20px; font-weight:bold; color:var(--btn-color);">
                💡 發現了嗎？「好喝」雖然重要，但解決他們當下的「麻煩」，才是吸引他們進店的關鍵！
            </p>
        </section>

        <!-- 第三頁：互動測驗應用 -->
        <section id="page-3" class="page">
            <h2>換你替店長做決定</h2>
            <p id="quiz-question" style="font-size: 1.3rem; font-weight: bold; margin-bottom: 20px;"></p>
            
            <!-- 選項將由 JS 自動生成於此 -->
            <div id="quiz-options"></div>

            <button id="submit-btn" class="btn" style="margin-top: 10px;" onclick="submitQuiz()">送出答案</button>

            <!-- 回饋與提示區塊 -->
            <div id="feedback-box"></div>
        </section>
    </main>

    <!-- 底部翻頁按鈕 -->
    <footer>
        <button id="prev-btn" class="btn" onclick="prevPage()">◀ 上一頁</button>
        <button id="next-btn" class="btn" onclick="nextPage()">下一頁 ▶</button>
    </footer>

    <script>
        // ==========================================
        // 集中設定：題目、選項、正解與解釋區
        // ==========================================
        const quizConfig = {
            question: "如果咖啡店決定優先服務「趕著上課的學生」，哪一項訴求最貼近他的需求？",
            options: [
                { id: 'A', text: 'A. 舒適座位，適合長時間討論' },
                { id: 'B', text: 'B. 預先點餐，到店快速取餐' },
                { id: 'C', text: 'C. 每個角落都適合拍照打卡' }
            ],
            correctAnswer: 'B',
            // 選錯時的專屬提示（不標示正解）
            hints: {
                'A': '他現在需要停留，還是盡快離開？',
                'C': '拍照空間能幫他更快去上課嗎？'
            },
            // 正確時的完整解釋
            explanations: {
                'A': '座位適合停留討論，沒有直接解決趕時間的問題。',
                'B': '快速取餐直接回應了趕時間的需求。',
                'C': '拍照空間沒有直接解決趕時間的問題。'
            }
        };

        // ==========================================
        // 全局狀態變數
        // ==========================================
        const totalPages = 3;
        let currentPage = 1;
        let selectedOptionId = null;
        let isAnswerSubmitted = false;

        // ==========================================
        // 系統初始化
        // ==========================================
        document.addEventListener("DOMContentLoaded", () => {
            initQuiz();
            updateUI();
        });

        // ==========================================
        // 翻頁邏輯與介面更新
        // ==========================================
        function prevPage() {
            if (currentPage > 1) {
                currentPage--;
                updateUI();
            }
        }

        function nextPage() {
            if (currentPage < totalPages) {
                currentPage++;
                updateUI();
            }
        }

        function updateUI() {
            // 切換頁面顯示
            document.querySelectorAll('.page').forEach((page, index) => {
                if (index + 1 === currentPage) {
                    page.classList.add('active');
                } else {
                    page.classList.remove('active');
                }
            });

            // 更新按鈕狀態（首尾停用，不循環）
            document.getElementById('prev-btn').disabled = (currentPage === 1);
            document.getElementById('next-btn').disabled = (currentPage === totalPages);

            // 更新進度列與頁碼
            document.getElementById('progress-bar').style.width = `${(currentPage / totalPages) * 100}%`;
            document.getElementById('page-indicator').innerText = `${currentPage} / ${totalPages} 頁`;

            // 換頁時回到網頁頂部
            window.scrollTo(0, 0);
        }

        // 支援左右方向鍵翻頁
        document.addEventListener('keydown', (e) => {
            if (e.key === 'ArrowLeft') prevPage();
            if (e.key === 'ArrowRight') nextPage();
        });

        // ==========================================
        // 測驗邏輯
        // ==========================================
        function initQuiz() {
            document.getElementById('quiz-question').innerText = quizConfig.question;
            const optionsContainer = document.getElementById('quiz-options');
            optionsContainer.innerHTML = ''; // 清空選項

            quizConfig.options.forEach(opt => {
                const btn = document.createElement('button');
                btn.className = 'quiz-option';
                btn.innerText = opt.text;
                btn.id = `opt-${opt.id}`;
                // 整個卡片按鈕可點選
                btn.onclick = () => selectOption(opt.id);
                optionsContainer.appendChild(btn);
            });
        }

        function selectOption(id) {
            if (isAnswerSubmitted) return; // 送出後鎖定，無法更改

            selectedOptionId = id;
            // 更新選取外觀
            document.querySelectorAll('.quiz-option').forEach(btn => {
                if (btn.id === `opt-${id}`) {
                    btn.classList.add('selected');
                } else {
                    btn.classList.remove('selected');
                }
            });
        }

        function submitQuiz() {
            if (!selectedOptionId) {
                alert('請先選擇一個選項再送出！');
                return;
            }

            isAnswerSubmitted = true;
            
            // 鎖定所有選項
            document.querySelectorAll('.quiz-option').forEach(btn => {
                btn.disabled = true;
            });
            
            document.getElementById('submit-btn').style.display = 'none';

            const feedbackBox = document.getElementById('feedback-box');
            feedbackBox.style.display = 'block';

            // 判斷對錯並顯示對應回饋
            if (selectedOptionId === quizConfig.correctAnswer) {
                // 答對：顯示正確解答及全部理由
                feedbackBox.className = 'feedback-success';
                feedbackBox.innerHTML = `
                    <h3 style="color:var(--btn-color); margin-top:0;">✅ 答對了！選項 ${quizConfig.correctAnswer} 是最佳訴求。</h3>
                    <p><strong>為何選 B：</strong>${quizConfig.explanations['B']}</p>
                    <hr style="border:0; border-top:1px solid #ccc; margin:15px 0;">
                    <p style="font-size:1rem; color:#444;"><strong>為何不選 A：</strong>${quizConfig.explanations['A']}</p>
                    <p style="font-size:1rem; color:#444;"><strong>為何不選 C：</strong>${quizConfig.explanations['C']}</p>
                `;
            } else {
                // 答錯：只顯示淡黃提示，不得標示正解，並提供重新作答
                feedbackBox.className = 'feedback-hint';
                feedbackBox.innerHTML = `
                    <h3 style="color:#A07D00; margin-top:0;">🤔 思考一下...</h3>
                    <p><strong>提示：</strong>${quizConfig.hints[selectedOptionId]}</p>
                    <button class="btn btn-outline" onclick="resetQuiz()">重新作答</button>
                `;
            }
        }

        function resetQuiz() {
            isAnswerSubmitted = false;
            selectedOptionId = null;
            
            // 清除選取與解鎖選項
            document.querySelectorAll('.quiz-option').forEach(btn => {
                btn.disabled = false;
                btn.classList.remove('selected');
            });

            // 隱藏回饋與恢復送出按鈕
            document.getElementById('feedback-box').style.display = 'none';
            document.getElementById('submit-btn').style.display = 'block';
        }
    </script>
</body>
</html>
