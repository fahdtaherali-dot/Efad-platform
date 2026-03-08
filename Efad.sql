-- إنشاء قاعدة البيانات الخاصة بمنصة إيفاد
CREATE DATABASE efad_platform;

-- استخدام قاعدة البيانات
USE efad_platform;

-- إنشاء جدول "المتقدمين" (Applicants)
CREATE TABLE applicants (
    id INT AUTO_INCREMENT PRIMARY KEY,               -- رقم تعريفي فريد لكل طالب (مثل البصمة)
    full_name VARCHAR(100) NOT NULL,                 -- اسم الطالب (نص، حد أقصى 100 حرف)
    email VARCHAR(150) UNIQUE NOT NULL,              -- الإيميل (لازم يكون فريد عشان ما يسجل مرتين)
    country VARCHAR(50) NOT NULL,                    -- دولة الإقامة (مهمة جداً لاستهداف مناطق النزاع)
    
    -- البيانات الأكاديمية (القلب النابض للخوارزمية)
    school_gpa DECIMAL(4,2) NOT NULL,                -- المعدل المدرسي (مثل 99.50)
    target_sat_score INT DEFAULT 0,                  -- درجة الـ SAT (الهدف المعتاد للقمة هو 1550+)
    target_ielts_score DECIMAL(3,1) DEFAULT 0.0,     -- درجة الآيلتس (الهدف المعتاد 7.5+)
    ap_exams_count INT DEFAULT 0,                    -- عدد اختبارات الـ AP (مثل التفاضل والتكامل، والفيزياء)
    
    -- الأنشطة اللامنهجية والمهارات (أهم شيء عند Rise)
    tech_skills VARCHAR(255),                        -- مهارات برمجية (مثل: Python, SQL, HTML)
    volunteer_project VARCHAR(255),                  -- مشاريع تطوعية (مثل مواقع تعليمية للأطفال المرضى)
    
    -- نتائج الذكاء الاصطناعي (بتتعبى بعدين بواسطة البايثون)
    ai_acceptance_probability INT DEFAULT 0,         -- نسبة القبول المتوقعة (مثل 75%)
    ai_feedback TEXT,                                -- نصيحة الذكاء الاصطناعي (خارطة الطريق)
    
    -- توثيق الوقت
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP   -- متى سجل الطالب في الموقع بالضبط
);


-- إدخال أول طالب تجريبي لاختبار قاعدة البيانات
INSERT INTO applicants 
(full_name, email, country, school_gpa, target_sat_score, target_ielts_score, ap_exams_count, tech_skills, volunteer_project) 
VALUES 
('طالب تجريبي', 'test@efad.com', 'Saudi Arabia', 99.50, 1550, 7.5, 4, 'HTML, SQL, Python', 'موقع الرياضيات أملنا لتعليم الأطفال المرضى');

-- عرض البيانات للتأكد من نجاح العملية
SELECT * FROM applicants;