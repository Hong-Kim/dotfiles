# encoding: UTF-8
require 'irb/ext/save-history'
IRB.conf[:SAVE_HISTORY] = 200
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb-history"

class Object
  def re
    load File.expand_path("~/.irbrc")
  end

  def time
    Benchmark.realtime { yield }
  end

  def list_from(idx)
    list = []
    Resque::Failure.all(0,100000).each_with_index do |f,i|
      next if i < idx
      args = f['payload']['args']
      # next if f['exception'] == 'Errno::EIO'
      # next unless f['exception'] == 'Excon::Errors::BadGateway'
      unless list.include?(args)
        list << i
        puts "#{f['failed_at']}: #{[i,f['exception'],args].inspect}"
      end
    end
    nil
  end

  def list
    list_from(0)
  end

  def info(i)
    f = Resque::Failure.all(i)
    pp f
    nil
  end

  def peek(queue_name = 'parse')
    queued_tasks = Resque.peek(queue_name, 0, 100000)
    queued_tasks.each { |t| puts t.inspect }
    puts "total: #{queued_tasks.count}"
    nil
  end

  def requeue(i)
    Resque::Failure.requeue(i)
  end

  def requeue_from(idx)
    count = Resque::Failure.count

    (idx..count-1).to_a.reverse.each do |i|
      requeue(i)
      puts "requeue: #{i}..."
    end
    nil
  end

  def count
    Resque::Failure.all(0,100000).count
  end

  def remove(i)
    Resque::Failure.remove(i)
  end

  def remove_from(idx)
    count = Resque::Failure.count

    (idx..count-1).to_a.reverse.each do |i|
      Resque::Failure.remove(i)
      puts "remove: #{i}..."
    end
    nil
  end
end

