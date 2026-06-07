<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html lang="en" class="scroll-smooth">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Acada Learning — DevOps & Cloud Training</title>
  <link href="images/DP black.png" rel="icon">

  <!-- Tailwind CSS -->
  <script src="https://cdn.tailwindcss.com"></script>
  <script>
    tailwind.config = {
      theme: {
        extend: {
          colors: {
            brand: {
              50:  '#f0f4ff',
              100: '#dbe4ff',
              500: '#4361ee',
              600: '#3a0ca3',
              700: '#2d0087',
              900: '#10002b',
            }
          },
          fontFamily: {
            sans: ['Inter', 'system-ui', 'sans-serif'],
          }
        }
      }
    }
  </script>

  <!-- Inter Font -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet">

  <!-- Alpine.js -->
  <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>

  <!-- GSAP + ScrollTrigger -->
  <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/gsap.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/gsap@3.12.5/dist/ScrollTrigger.min.js"></script>

  <style>
    [x-cloak] { display: none !important; }

    .gradient-mesh {
      background: radial-gradient(ellipse 80% 50% at 50% -20%, rgba(67,97,238,0.3), transparent),
                  radial-gradient(ellipse 60% 40% at 80% 60%, rgba(58,12,163,0.2), transparent),
                  #06030f;
    }

    .glass {
      background: rgba(255,255,255,0.05);
      backdrop-filter: blur(12px);
      border: 1px solid rgba(255,255,255,0.1);
    }

    .glow-ring {
      box-shadow: 0 0 0 1px rgba(67,97,238,0.4), 0 0 40px rgba(67,97,238,0.15);
    }

    .stat-card {
      background: linear-gradient(135deg, rgba(67,97,238,0.12), rgba(58,12,163,0.08));
      border: 1px solid rgba(67,97,238,0.25);
    }

    .hero-tag {
      background: linear-gradient(90deg, rgba(67,97,238,0.2), rgba(58,12,163,0.2));
      border: 1px solid rgba(67,97,238,0.35);
    }

    .btn-primary {
      background: linear-gradient(135deg, #4361ee, #3a0ca3);
      box-shadow: 0 4px 24px rgba(67,97,238,0.4);
      transition: all 0.3s ease;
    }
    .btn-primary:hover {
      box-shadow: 0 8px 32px rgba(67,97,238,0.6);
      transform: translateY(-2px);
    }

    .service-card:hover .service-icon {
      transform: scale(1.15) rotate(-6deg);
    }

    .marquee-track {
      animation: marquee 20s linear infinite;
    }
    @keyframes marquee {
      0%   { transform: translateX(0); }
      100% { transform: translateX(-50%); }
    }
  </style>
</head>

<%
  String ip = "";
  String hostname = "";
  try {
    InetAddress inetAddress = InetAddress.getLocalHost();
    ip = inetAddress.getHostAddress();
    hostname = inetAddress.getHostName();
  } catch (Exception e) {
    ip = "unavailable";
    hostname = "unavailable";
  }
%>

<body class="gradient-mesh text-white font-sans antialiased" x-data="{ mobileOpen: false, employeeData: null, loadingEmployee: false }">

  <!-- ── NAV ── -->
  <nav class="fixed top-0 inset-x-0 z-50 glass border-b border-white/10">
    <div class="max-w-7xl mx-auto px-6 h-16 flex items-center justify-between">
      <div class="flex items-center gap-3">
        <img src="images/DP black.png" alt="Acada" class="h-8 w-8 rounded-lg object-contain bg-white/10 p-1">
        <span class="font-bold text-lg tracking-tight">Acada <span class="text-brand-500">Learning</span></span>
      </div>

      <div class="hidden md:flex items-center gap-8 text-sm font-medium text-white/70">
        <a href="#about"    class="hover:text-white transition-colors">About</a>
        <a href="#services" class="hover:text-white transition-colors">Services</a>
        <a href="#training" class="hover:text-white transition-colors">Training</a>
        <a href="#contact"  class="hover:text-white transition-colors">Contact</a>
      </div>

      <div class="hidden md:flex items-center gap-3">
        <a href="mailto:info@acadalearning.com" class="text-sm font-medium text-white/70 hover:text-white transition-colors">Mail Us</a>
        <a href="services/employee/getEmployeeDetails"
           class="btn-primary px-4 py-2 rounded-lg text-sm font-semibold">
          Employee Portal
        </a>
      </div>

      <button class="md:hidden p-2 rounded-lg glass" @click="mobileOpen = !mobileOpen">
        <svg class="w-5 h-5" fill="none" stroke="currentColor" stroke-width="2" viewBox="0 0 24 24">
          <path x-show="!mobileOpen" stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16"/>
          <path x-show="mobileOpen"  stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12"/>
        </svg>
      </button>
    </div>

    <div x-show="mobileOpen" x-cloak x-transition class="md:hidden glass border-t border-white/10 px-6 py-4 flex flex-col gap-4 text-sm font-medium">
      <a href="#about"    @click="mobileOpen=false" class="hover:text-brand-500 transition-colors">About</a>
      <a href="#services" @click="mobileOpen=false" class="hover:text-brand-500 transition-colors">Services</a>
      <a href="#training" @click="mobileOpen=false" class="hover:text-brand-500 transition-colors">Training</a>
      <a href="#contact"  @click="mobileOpen=false" class="hover:text-brand-500 transition-colors">Contact</a>
      <a href="services/employee/getEmployeeDetails" class="btn-primary text-center px-4 py-2 rounded-lg font-semibold">Employee Portal</a>
    </div>
  </nav>

  <!-- ── HERO ── -->
  <section class="relative min-h-screen flex items-center justify-center px-6 pt-24 overflow-hidden">
    <div class="absolute inset-0 overflow-hidden pointer-events-none">
      <div class="absolute top-1/4 left-1/4 w-96 h-96 bg-brand-500/10 rounded-full blur-3xl" id="orb1"></div>
      <div class="absolute bottom-1/4 right-1/4 w-80 h-80 bg-brand-600/10 rounded-full blur-3xl" id="orb2"></div>
    </div>

    <div class="relative max-w-4xl mx-auto text-center" id="hero-content">
      <div class="inline-flex items-center gap-2 hero-tag rounded-full px-4 py-2 text-sm font-medium text-brand-100 mb-8" id="hero-tag">
        <span class="w-2 h-2 bg-green-400 rounded-full animate-pulse"></span>
        Calgary, Alberta, Canada · Hiring Now
      </div>

      <h1 class="text-5xl md:text-7xl font-black tracking-tight leading-none mb-6" id="hero-title">
        Build the Future<br>
        <span class="bg-gradient-to-r from-brand-500 to-purple-400 bg-clip-text text-transparent">with DevOps & Cloud</span>
      </h1>

      <p class="text-lg md:text-xl text-white/60 max-w-2xl mx-auto mb-10 leading-relaxed" id="hero-sub">
        Acada Learning equips IT engineers with world-class DevOps, Linux, and Cloud training —
        delivering quality software solutions to millions of clients globally.
      </p>

      <div class="flex flex-col sm:flex-row gap-4 justify-center" id="hero-cta">
        <a href="#training" class="btn-primary px-8 py-4 rounded-xl font-semibold text-base">
          Explore Training →
        </a>
        <a href="#contact" class="glass px-8 py-4 rounded-xl font-semibold text-base text-white/80 hover:text-white transition-all hover:bg-white/10">
          Get in Touch
        </a>
      </div>
    </div>
  </section>

  <!-- ── MARQUEE ── -->
  <div class="border-y border-white/10 py-4 overflow-hidden bg-black/20">
    <div class="flex gap-12 marquee-track whitespace-nowrap text-sm font-medium text-white/40 uppercase tracking-widest">
      <span>DevOps</span><span>·</span><span>Linux</span><span>·</span><span>AWS</span><span>·</span>
      <span>Kubernetes</span><span>·</span><span>CI/CD</span><span>·</span><span>Docker</span><span>·</span>
      <span>Terraform</span><span>·</span><span>Jenkins</span><span>·</span><span>Ansible</span><span>·</span>
      <span>Cloud Engineering</span><span>·</span><span>Spring Boot</span><span>·</span>
      <span>DevOps</span><span>·</span><span>Linux</span><span>·</span><span>AWS</span><span>·</span>
      <span>Kubernetes</span><span>·</span><span>CI/CD</span><span>·</span><span>Docker</span><span>·</span>
      <span>Terraform</span><span>·</span><span>Jenkins</span><span>·</span><span>Ansible</span><span>·</span>
      <span>Cloud Engineering</span><span>·</span><span>Spring Boot</span><span>·</span>
    </div>
  </div>

  <!-- ── STATS ── -->
  <section class="py-24 px-6" id="about">
    <div class="max-w-7xl mx-auto">
      <div class="grid grid-cols-2 md:grid-cols-4 gap-6 stat-section">
        <div class="stat-card rounded-2xl p-6 text-center glow-ring">
          <div class="text-4xl font-black text-brand-500 mb-1" data-count="1000000">0</div>
          <div class="text-sm text-white/50 font-medium">Clients Served</div>
        </div>
        <div class="stat-card rounded-2xl p-6 text-center">
          <div class="text-4xl font-black text-purple-400 mb-1" data-count="500">0</div>
          <div class="text-sm text-white/50 font-medium">Engineers Trained</div>
        </div>
        <div class="stat-card rounded-2xl p-6 text-center">
          <div class="text-4xl font-black text-pink-400 mb-1" data-count="12">0</div>
          <div class="text-sm text-white/50 font-medium">Years Experience</div>
        </div>
        <div class="stat-card rounded-2xl p-6 text-center">
          <div class="text-4xl font-black text-green-400 mb-1">100%</div>
          <div class="text-sm text-white/50 font-medium">Placement Rate</div>
        </div>
      </div>
    </div>
  </section>

  <!-- ── SERVICES ── -->
  <section class="py-24 px-6" id="services">
    <div class="max-w-7xl mx-auto">
      <div class="text-center mb-16 section-header">
        <p class="text-brand-500 text-sm font-semibold uppercase tracking-widest mb-3">What We Do</p>
        <h2 class="text-4xl md:text-5xl font-black tracking-tight">World-Class Services</h2>
        <p class="text-white/50 mt-4 max-w-xl mx-auto">From consulting to full software delivery — we cover the entire stack.</p>
      </div>

      <div class="grid md:grid-cols-3 gap-6">
        <div class="service-card glass rounded-2xl p-8 hover:bg-white/10 transition-all duration-300 group cursor-pointer">
          <div class="service-icon text-4xl mb-6 transition-transform duration-300">🚀</div>
          <h3 class="text-xl font-bold mb-3">DevOps Training</h3>
          <p class="text-white/50 text-sm leading-relaxed">
            Hands-on Linux, Docker, Kubernetes, Jenkins CI/CD pipelines and cloud infrastructure for real-world engineers.
          </p>
        </div>
        <div class="service-card glass rounded-2xl p-8 hover:bg-white/10 transition-all duration-300 group cursor-pointer">
          <div class="service-icon text-4xl mb-6 transition-transform duration-300">☁️</div>
          <h3 class="text-xl font-bold mb-3">Cloud Solutions</h3>
          <p class="text-white/50 text-sm leading-relaxed">
            AWS, Azure, and GCP architecture, migration, and optimization for enterprise-grade reliability and scale.
          </p>
        </div>
        <div class="service-card glass rounded-2xl p-8 hover:bg-white/10 transition-all duration-300 group cursor-pointer">
          <div class="service-icon text-4xl mb-6 transition-transform duration-300">💻</div>
          <h3 class="text-xl font-bold mb-3">Software Development</h3>
          <p class="text-white/50 text-sm leading-relaxed">
            Custom software solutions built on proven Java/Spring stacks, serving millions of clients worldwide.
          </p>
        </div>
      </div>
    </div>
  </section>

  <!-- ── TRAINING ── -->
  <section class="py-24 px-6 bg-black/20" id="training">
    <div class="max-w-7xl mx-auto">
      <div class="text-center mb-16 section-header">
        <p class="text-brand-500 text-sm font-semibold uppercase tracking-widest mb-3">Programs</p>
        <h2 class="text-4xl md:text-5xl font-black tracking-tight">Training Tracks</h2>
      </div>

      <div class="grid md:grid-cols-2 gap-6">
        <div class="glass rounded-2xl p-8 border border-brand-500/20 hover:border-brand-500/50 transition-all duration-300 training-card">
          <div class="flex items-start gap-4">
            <div class="w-12 h-12 rounded-xl bg-brand-500/20 flex items-center justify-center text-2xl flex-shrink-0">🐧</div>
            <div>
              <h3 class="text-lg font-bold mb-2">Linux & Shell Scripting</h3>
              <p class="text-white/50 text-sm leading-relaxed mb-4">Master the command line, system administration, and automation scripting for production environments.</p>
              <div class="flex gap-2 flex-wrap">
                <span class="text-xs px-3 py-1 rounded-full bg-white/10 text-white/70">Beginner</span>
                <span class="text-xs px-3 py-1 rounded-full bg-white/10 text-white/70">8 Weeks</span>
                <span class="text-xs px-3 py-1 rounded-full bg-green-500/20 text-green-400">Open</span>
              </div>
            </div>
          </div>
        </div>

        <div class="glass rounded-2xl p-8 border border-purple-500/20 hover:border-purple-500/50 transition-all duration-300 training-card">
          <div class="flex items-start gap-4">
            <div class="w-12 h-12 rounded-xl bg-purple-500/20 flex items-center justify-center text-2xl flex-shrink-0">⚙️</div>
            <div>
              <h3 class="text-lg font-bold mb-2">CI/CD Pipelines</h3>
              <p class="text-white/50 text-sm leading-relaxed mb-4">Jenkins, GitHub Actions, ArgoCD — build, test, and deploy pipelines from scratch to production.</p>
              <div class="flex gap-2 flex-wrap">
                <span class="text-xs px-3 py-1 rounded-full bg-white/10 text-white/70">Intermediate</span>
                <span class="text-xs px-3 py-1 rounded-full bg-white/10 text-white/70">10 Weeks</span>
                <span class="text-xs px-3 py-1 rounded-full bg-green-500/20 text-green-400">Open</span>
              </div>
            </div>
          </div>
        </div>

        <div class="glass rounded-2xl p-8 border border-pink-500/20 hover:border-pink-500/50 transition-all duration-300 training-card">
          <div class="flex items-start gap-4">
            <div class="w-12 h-12 rounded-xl bg-pink-500/20 flex items-center justify-center text-2xl flex-shrink-0">🐳</div>
            <div>
              <h3 class="text-lg font-bold mb-2">Docker & Kubernetes</h3>
              <p class="text-white/50 text-sm leading-relaxed mb-4">Containerisation, orchestration, Helm charts, and managing production Kubernetes clusters at scale.</p>
              <div class="flex gap-2 flex-wrap">
                <span class="text-xs px-3 py-1 rounded-full bg-white/10 text-white/70">Advanced</span>
                <span class="text-xs px-3 py-1 rounded-full bg-white/10 text-white/70">12 Weeks</span>
                <span class="text-xs px-3 py-1 rounded-full bg-yellow-500/20 text-yellow-400">Filling Fast</span>
              </div>
            </div>
          </div>
        </div>

        <div class="glass rounded-2xl p-8 border border-green-500/20 hover:border-green-500/50 transition-all duration-300 training-card">
          <div class="flex items-start gap-4">
            <div class="w-12 h-12 rounded-xl bg-green-500/20 flex items-center justify-center text-2xl flex-shrink-0">☁️</div>
            <div>
              <h3 class="text-lg font-bold mb-2">AWS Cloud Engineering</h3>
              <p class="text-white/50 text-sm leading-relaxed mb-4">EC2, S3, RDS, Lambda, VPC and full cloud architecture for the AWS Solutions Architect certification path.</p>
              <div class="flex gap-2 flex-wrap">
                <span class="text-xs px-3 py-1 rounded-full bg-white/10 text-white/70">All Levels</span>
                <span class="text-xs px-3 py-1 rounded-full bg-white/10 text-white/70">16 Weeks</span>
                <span class="text-xs px-3 py-1 rounded-full bg-green-500/20 text-green-400">Open</span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- ── EMPLOYEE DATA (Live API) ── -->
  <section class="py-24 px-6" id="employee">
    <div class="max-w-3xl mx-auto text-center" x-data="employeeWidget()">
      <p class="text-brand-500 text-sm font-semibold uppercase tracking-widest mb-3">Live Data</p>
      <h2 class="text-4xl font-black tracking-tight mb-4">Employee Portal</h2>
      <p class="text-white/50 mb-10">Fetch live employee data directly from the Spring REST API.</p>

      <button
        @click="fetchEmployee()"
        :disabled="loading"
        class="btn-primary px-8 py-4 rounded-xl font-semibold text-base mb-10 disabled:opacity-50 disabled:cursor-not-allowed">
        <span x-show="!loading">Fetch Employee Details</span>
        <span x-show="loading" x-cloak class="flex items-center gap-2 justify-center">
          <svg class="animate-spin w-4 h-4" fill="none" viewBox="0 0 24 24">
            <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
            <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8v8z"></path>
          </svg>
          Loading...
        </span>
      </button>

      <div x-show="data" x-cloak x-transition
           class="glass rounded-2xl p-8 text-left grid gap-3">
        <template x-for="[key, val] in Object.entries(data || {})" :key="key">
          <div class="flex justify-between items-center py-3 border-b border-white/10 last:border-0">
            <span class="text-white/50 text-sm font-medium" x-text="key"></span>
            <span class="font-semibold text-sm" x-text="val"></span>
          </div>
        </template>
      </div>

      <p x-show="error" x-cloak class="text-red-400 text-sm mt-4" x-text="error"></p>
    </div>
  </section>

  <!-- ── SERVER INFO ── -->
  <section class="py-12 px-6 bg-black/30">
    <div class="max-w-7xl mx-auto">
      <div class="glass rounded-2xl p-6 flex flex-col md:flex-row gap-4 items-center justify-between">
        <div class="flex items-center gap-3">
          <span class="w-2 h-2 bg-green-400 rounded-full animate-pulse"></span>
          <span class="text-sm text-white/60 font-medium">Server Status: <span class="text-green-400">Online</span></span>
        </div>
        <div class="flex flex-col sm:flex-row gap-6 text-sm text-white/50">
          <span>Hostname: <span class="text-white/80 font-mono"><%= hostname %></span></span>
          <span>IP Address: <span class="text-white/80 font-mono"><%= ip %></span></span>
        </div>
      </div>
    </div>
  </section>

  <!-- ── CONTACT ── -->
  <section class="py-24 px-6" id="contact">
    <div class="max-w-7xl mx-auto">
      <div class="glass rounded-3xl p-12 md:p-16 text-center glow-ring">
        <p class="text-brand-500 text-sm font-semibold uppercase tracking-widest mb-4">Get Started</p>
        <h2 class="text-4xl md:text-5xl font-black tracking-tight mb-6">
          Ready to Level Up<br>Your Engineering Career?
        </h2>
        <p class="text-white/50 max-w-xl mx-auto mb-10 leading-relaxed">
          Join engineers from across Africa, Canada, and beyond. Everyone will be hired.
        </p>
        <div class="flex flex-col sm:flex-row gap-4 justify-center">
          <a href="mailto:info@acadalearning.com" class="btn-primary px-8 py-4 rounded-xl font-semibold text-base">
            info@acadalearning.com
          </a>
          <a href="tel:+15875742233" class="glass px-8 py-4 rounded-xl font-semibold text-base text-white/80 hover:text-white hover:bg-white/10 transition-all">
            +1 587 574 2233
          </a>
        </div>
      </div>
    </div>
  </section>

  <!-- ── FOOTER ── -->
  <footer class="border-t border-white/10 py-8 px-6">
    <div class="max-w-7xl mx-auto flex flex-col md:flex-row items-center justify-between gap-4 text-sm text-white/40">
      <div class="flex items-center gap-2">
        <img src="images/DP black.png" alt="Acada" class="h-6 w-6 rounded object-contain bg-white/10 p-0.5">
        <span>Acada Learning — Calgary, Alberta, Canada</span>
      </div>
      <span>© 2024 <a href="http://acadalearning.com/" class="hover:text-white/70 transition-colors">Acada Learning</a>. All rights reserved.</span>
    </div>
  </footer>

  <!-- ── SCRIPTS ── -->
  <script>
    function employeeWidget() {
      return {
        loading: false,
        data: null,
        error: null,
        async fetchEmployee() {
          this.loading = true;
          this.data = null;
          this.error = null;
          try {
            const res = await fetch('services/employee/getEmployeeDetails');
            if (!res.ok) throw new Error('Server returned ' + res.status);
            this.data = await res.json();
          } catch (e) {
            this.error = 'Could not fetch employee data: ' + e.message;
          } finally {
            this.loading = false;
          }
        }
      }
    }

    document.addEventListener('DOMContentLoaded', () => {
      gsap.registerPlugin(ScrollTrigger);

      // Hero entrance
      const heroTl = gsap.timeline({ defaults: { ease: 'power3.out' } });
      heroTl
        .from('#hero-tag',   { y: 20, opacity: 0, duration: 0.6 })
        .from('#hero-title', { y: 40, opacity: 0, duration: 0.8 }, '-=0.3')
        .from('#hero-sub',   { y: 30, opacity: 0, duration: 0.7 }, '-=0.5')
        .from('#hero-cta',   { y: 20, opacity: 0, duration: 0.6 }, '-=0.4');

      // Floating orbs
      gsap.to('#orb1', { y: -40, x: 20, duration: 6, repeat: -1, yoyo: true, ease: 'sine.inOut' });
      gsap.to('#orb2', { y: 30,  x: -20, duration: 8, repeat: -1, yoyo: true, ease: 'sine.inOut' });

      // Stat counters
      document.querySelectorAll('[data-count]').forEach(el => {
        const target = parseInt(el.dataset.count);
        ScrollTrigger.create({
          trigger: el,
          start: 'top 85%',
          once: true,
          onEnter: () => gsap.to({ val: 0 }, {
            val: target,
            duration: 2,
            ease: 'power2.out',
            onUpdate: function() {
              el.textContent = Math.round(this.targets()[0].val).toLocaleString() + (target >= 1000 ? '+' : '+');
            }
          })
        });
      });

      // Section headers
      gsap.utils.toArray('.section-header').forEach(el => {
        gsap.from(el, {
          y: 40, opacity: 0, duration: 0.8,
          scrollTrigger: { trigger: el, start: 'top 80%', once: true }
        });
      });

      // Service cards stagger
      gsap.utils.toArray('.service-card').forEach((card, i) => {
        gsap.from(card, {
          y: 50, opacity: 0, duration: 0.7,
          delay: i * 0.1,
          scrollTrigger: { trigger: card, start: 'top 85%', once: true }
        });
      });

      // Training cards
      gsap.utils.toArray('.training-card').forEach((card, i) => {
        gsap.from(card, {
          x: i % 2 === 0 ? -40 : 40, opacity: 0, duration: 0.8,
          scrollTrigger: { trigger: card, start: 'top 85%', once: true }
        });
      });

      // Stat section
      gsap.from('.stat-section', {
        y: 40, opacity: 0, duration: 0.8,
        scrollTrigger: { trigger: '.stat-section', start: 'top 80%', once: true }
      });
    });
  </script>

</body>
</html>
