# 오늘은 여기까지 (enoughday) ☁️

> 미루기를 귀엽게 합리화해 주는 핑계 생성형 투두 앱

할 일을 다 못 했어도 괜찮아요. **오늘은 여기까지**는 못 한 일에 그럴듯한 핑계를 붙여주고, 구름 마스코트가 하루를 다정하게 마무리해 주는 to-do 웹앱입니다.

🔗 **데모**
- GitHub Pages: https://jhc2265.github.io/enoughday/
- 깃허브 페이지는 로그인 없이 이용가능합니다! 그냥 구글로 로그인 버튼을 눌러주세요.
- Firebase Hosting: https://enoughday2265.web.app

---

## ✨ 주요 기능

- **할 일 관리** — 추가 / 완료 체크, 카테고리, 오늘 날짜 기반 정리
- **핑계 자동 생성** — 못 한 일에 위트 있는 핑계를 자동으로 붙여줘요
- **핑계 말투 선택** — 귀여운 · 진지한 · 회사 메일식 · 중2병 · 철학적 등 톤 변경
- **오늘의 리포트** — 해낸 일 / 못한 일 / 대표 핑계 / 오늘의 판정 요약
- **반복 · 이월** — 미룬 일을 다음 날로 넘기고 날짜별로 기록
- **주간 리포트** — 가장 자주 미룬 일, 핑계 랭킹 등 누적 통계
- **다크모드** — 밤에는 달 마스코트로 전환
- **마스코트 감정 반응** — 달성도에 따라 구름 표정이 바뀜
- **로그인 & 클라우드 동기화** — 구글 로그인 시 기기 간 데이터 동기화
- **백업** — 데이터 백업 / 복원

> 로그인하지 않으면 브라우저(localStorage)에 저장되고, 구글 로그인하면 클라우드(Firestore)로 동기화됩니다.

---

## 🛠 기술 스택

- **Frontend** — HTML / CSS / JavaScript (단일 페이지, 빌드 도구 없음)
- **인증** — Firebase Authentication (Google 로그인)
- **데이터베이스** — Cloud Firestore
- **호스팅** — GitHub Pages · Firebase Hosting

---

## 🚀 실행 방법

### 로컬에서 보기
```
index.html 파일을 브라우저로 열기
```
> ⚠️ 구글 로그인 / 클라우드 동기화는 `file://`(더블클릭)에서는 동작하지 않고, 호스팅된 https 주소 또는 localhost에서만 됩니다. 로컬에서 그냥 열면 localStorage 저장으로만 동작해요.

### Firebase Hosting으로 배포
```bash
firebase deploy
```

---

## ⚙️ Firebase 설정

이 앱을 직접 포크해서 쓰려면 본인 Firebase 프로젝트가 필요합니다.

1. [Firebase 콘솔](https://console.firebase.google.com)에서 프로젝트 생성 → 웹 앱 등록 → `firebaseConfig` 복사
2. **Authentication → Sign-in method → Google** 사용 설정
3. **Firestore Database** 생성 (위치: `asia-northeast3` 서울 권장)
4. Firestore **보안 규칙** 설정 — 각자 자기 데이터만 읽고 쓰도록:

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{uid} {
      allow read, write: if request.auth != null && request.auth.uid == uid;
    }
  }
}
```

5. **Authentication → Settings → 승인된 도메인**에 배포 주소(예: `jhc2265.github.io`) 추가
6. 코드의 `firebaseConfig` 값을 본인 프로젝트 값으로 교체

> 참고: Firebase 웹 `apiKey`는 비밀키가 아니라 프로젝트 식별자라서 공개 저장소에 올라가도 안전합니다. 실제 보안은 Firestore 규칙 + 승인된 도메인으로 관리합니다.

---

## 📁 폴더 구조

```
enoughday/
├── index.html        # 앱 본체 (HTML/CSS/JS)
├── assets/           # 아이콘 이미지 (ic_*.png)
├── firebase.json     # Firebase Hosting 설정
└── .firebaserc       # Firebase 프로젝트 연결 정보
```

---

## 📝 라이선스

개인 프로젝트입니다.
