### 01. What is PostgreSQL?
**উত্তর:**
PostgreSQL একটি ওপেন-সোর্স অবজেক্ট-রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম, যা রিলেশনাল ডাটাবেস এবং অবজেক্ট-ওরিয়েন্টেড প্রোগ্রামিংকে একত্রিত করে।

_PostgreSQL_-কে সংক্ষেপে অনেক সময় **Postgres** নামে ডাকা হয়। এটি একটি আধুনিক ওপেন-সোর্স অবজেক্ট রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (ORDBMS)।

---

### 02. Explain the Primary Key and Foreign Key concepts in PostgreSQL.

**Primary Key:**
- Primary Key টেবিলের প্রতিটি রেকর্ডের জন্য একটি ইউনিক পরিচয় হিসেবে কাজ করে।
- এটার মান কখনও NULL হবে না।
- একাধিক কলাম নিয়ে Primary Key গঠিত হলে তাকে Composite Key বলে।

#### উদাহরণ:

`Users` নামের একটি টেবিলে `UserID`, `Username`, `Email` থাকলে, `UserID` কে **primary key** হিসাবে ব্যবহার করা যায়.

**Foreign Key:**
- **Foreign Key** হলো এমন একটি ফিল্ড যা অন্য একটি টেবিলের **Primary Key** কে নির্দেশ করে।
- এটি দুটি টেবিলের মধ্যে সম্পর্ক তৈরি করে যাকে **Referential Integrity** বলে।

#### উদাহরণ:
`Orders` টেবিলে একটি `CustomerID` থাকতে পারে, যা `Customers` টেবিলের `CustomerID` কে **Foreign Key** হিসেবে রেফার করে।

### 03. What is the difference between the VARCHAR and CHAR data types?

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

### 04. Explain the purpose of the WHERE clause in a SELECT statement.
**উত্তর:**
`SELECT` স্টেটমেন্টে `WHERE` clause ব্যবহার করা হয় **ডেটা ফিল্টার** করার জন্য।

যেসব রেকর্ড শর্ত পূরণ করে শুধুমাত্র সেই রেকর্ডগুলোই ফলাফল হিসাবে অন্তর্ভুক্ত হয়।

**মূল ব্যবহারসমূহ:**
- ডেটা ফিল্টার করা
- নির্দিষ্ট ডেটা রিটারিভ করা
- কোয়েরির কার্যকারিতা বৃদ্ধি

---

### 05. What are the LIMIT and OFFSET clauses used for?
**উত্তর:**
`LIMIT` এবং `OFFSET` clause ব্যবহার করে একটি কোয়েরি কতটি রেকর্ড রিটার্ন করবে এবং কোথা থেকে শুরু করবে তা নিয়ন্ত্রণ করা যায়।

#### LIMIT:
- সর্বোচ্চ কত সংখ্যক রেকর্ড প্রদর্শন করবে তা নির্ধারণ করে।

#### OFFSET:
- কত সংখ্যক রেকর্ড **Skip** করবে তা নির্ধারণ করে।

**উদাহরণ:**
```sql
SELECT * FROM table LIMIT 10 OFFSET 20;
```
