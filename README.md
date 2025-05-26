### 01. PostgreSQL কী?

**উত্তর:**
PostgreSQL একটি ওপেন-সোর্স অবজেক্ট-রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম, যা রিলেশনাল ডাটাবেস এবং অবজেক্ট-ওরিয়েন্টেড প্রোগ্রামিংকে একত্রিত করে।

_PostgreSQL_-কে সংক্ষেপে অনেক সময় **Postgres** নামে ডাকা হয়। এটি একটি আধুনিক ওপেন-সোর্স অবজেক্ট রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (ORDBMS)।

---

### 02. PostgreSQL-এ Primary Key ও Foreign Key এর ব্যাখ্যা

** Primary Key:**

- Primary Key টেবিলের প্রতিটি রেকর্ডের জন্য একটি ইউনিক পরিচয় হিসেবে কাজ করে।
- এটার মান কখনও NULL হবে না।
- একাধিক কলাম নিয়ে Primary Key গঠিত হলে তাকে Composite Key বলে।

#### উদাহরণ:

`Users` নামের একটি টেবিলে `UserID`, `Username`, `Email` থাকলে, `UserID` কে **primary key** হিসাবে ব্যবহার করা যায়.

** Foreign Key:**

- **Foreign Key** হলো এমন একটি ফিল্ড যা অন্য একটি টেবিলের **Primary Key** কে নির্দেশ করে।
- এটি দুটি টেবিলের মধ্যে সম্পর্ক তৈরি করে যাকে **Referential Integrity** বলে।

#### উদাহরণ:

`Orders` টেবিলে একটি `CustomerID` থাকতে পারে, যা `Customers` টেবিলের `CustomerID` কে **Foreign Key** হিসেবে রেফার করে।

### 03. CHAR এবং VARCHAR ডেটা টাইপের মধ্যে পার্থক্য

#### CHAR:

- এটি একটি **Fixed-length** ডেটা টাইপ।
- String ছোট হলেও সবসময় নির্দিষ্ট পরিমাণ মেমোরি বরাদ্দ রাখে।
- ছোট String এর ক্ষেত্রে **spaces** দিয়ে প্যাডিং করা হয়।

#### VARCHAR:

- এটি একটি **Variable-length** ডেটা টাইপ।
- শুধুমাত্র String এর Actual Length অনুযায়ী মেমোরি ব্যবহার করে।
- **spaces** দিয়ে প্যাডিং করে না।

**Summary Table:**

| Feature  | CHAR                        | VARCHAR                  |
| -------- | --------------------------- | ------------------------ |
| Length   | Fixed                       | Variable                 |
| Storage  | Always same size            | Depends on string length |
| Padding  | Yes, with spaces            | No padding               |
| Use Case | Short, fixed-length strings | Variable-length strings  |

---
